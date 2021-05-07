﻿using CoreProject.Managers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ubay_CourseRegistration.Students
{
    public partial class StudentCourseRecord : System.Web.UI.Page
    {
        StudentManagers _studentManagers = new StudentManagers();
        readonly PagedDataSource _pgsource = new PagedDataSource();
        static DateTime datetime = DateTime.Now;
        int _firstIndex, _lastIndex;
        string _ID ;
        public string _month { get; set; } = "";
        private int _pageSize = 10;

        protected void Page_Load(object sender, EventArgs e)
        {

            _ID = Session["Acc_sum_ID"].ToString();
            if (Page.IsPostBack) return;
            BindDataIntoRepeater();

            //查詢教師
            ReadTeacherTable();


            var _post = Request.QueryString["datetime"];
            if (_post != null)
                datetime = DateTime.Parse(_post);
            TEST.Text = $"{datetime.ToString("yyyy/MM")}月課程紀錄";
            CreateCalendar();
        }

        private void BindDataIntoRepeater()
        {
            var dtt = _studentManagers.GetStudentCourseRecord(_ID);
            _pgsource.DataSource = dtt.DefaultView;
            _pgsource.AllowPaging = true;
            // 要在Repeater顯示的項目數 
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            //維持顯示 Total pages
            ViewState["TotalPages"] = _pgsource.PageCount;
            // 顯示現在頁數之於總頁數  Example: "Page 1 of 10"
            lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            //First, Last, Previous, Next 按鈕的使用控制
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind資料進Repeater
            rptResult.DataSource = _pgsource;
            rptResult.DataBind();

            //呼叫Repeater分頁
            HandlePaging();
        }

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        private void HandlePaging()
        {
            var dtt = new DataTable();
            dtt.Columns.Add("PageIndex"); //Start from 0
            dtt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // 檢查最後一頁是否大於總頁數，然後將其設為總頁數
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }
            //如果第一頁索引小於0時 將他設回0
            if (_firstIndex < 0)
                _firstIndex = 0;

            //根據前面的first 和 last page索引，建立頁碼
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dtt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dtt.Rows.Add(dr);
            }

            rptPaging.DataSource = dtt;
            rptPaging.DataBind();
        }


        #region repeater下方頁碼按鈕功能
        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void lbFirst_Click1(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindDataIntoRepeater();
        }

        protected void lbPrevious_Click1(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }

        protected void lbNext_Click1(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void lbLast_Click1(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            BindDataIntoRepeater();
        }
        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.FromName("#F75C2F");
        }

        #endregion

        public  DataTable ReadTeacherTable()
        {
            //帶入查詢教師的下拉選單內容
            string connectionstring =
                "Data Source=localhost\\SQLExpress;Initial Catalog=Course_Selection_System_of_UBAY; Integrated Security=true";
            string queryString = $@"SELECT Teacher_ID, CONCAT(Teacher_FirstName,Teacher_LastName ) as Teacher_Name FROM Teacher;";
            SqlConnection connection = new SqlConnection(connectionstring);
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter(command);
            ad.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ddlTeacher.DataSource = dt;
                ddlTeacher.DataTextField = "Teacher_Name";
                ddlTeacher.DataValueField = "Teacher_ID";
                ddlTeacher.DataBind();
                //搜尋全部教師選項的空值
                ddlTeacher.Items.Insert(0, "");
                ddlTeacher.SelectedIndex = 0;
            }
            connection.Close();
            return dt;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            rptResult.DataSource = _studentManagers.SearchCouser(
                            _ID,
                            txtCourseID.Text,
                            txtCourseName.Text,
                            txtStartDate1.Text,
                            txtStartDate2.Text,
                            txtPlace.Text,
                            TxtPrice1.Text,
                            TxtPrice2.Text,
                            ddlTeacher.SelectedValue
                            ); ;
            rptResult.DataBind();

        }

        //月曆的上、下一月功能
        protected void NextMonth_Click(object sender, EventArgs e)
        {
            switch (((Button)sender).CommandName)
            {
                case "Next":
                    datetime = datetime.AddMonths(1);
                    break;
                case "Previous":
                    datetime = datetime.AddMonths(-1);
                    break;
            }
            
            Response.Redirect($"StudentCourseRecord.aspx?datetime={datetime.ToString("yyyy/MM/dd")}");

            CreateCalendar();
        }


        protected void CreateCalendar()//int InYear, int InMonth)
        {
            DataTable dt_course = _studentManagers.GetStudentCourseRecord(_ID);
            DataTable dt_calendar = new DataTable();

            dt_calendar.Columns.Add(new DataColumn("Date"));
            dt_calendar.Columns.Add(new DataColumn("Course"));
            dt_calendar.Columns.Add(new DataColumn("Place"));
            dt_calendar.Columns.Add(new DataColumn("StartTime"));
            

            int j = (int)datetime.AddDays(-datetime.Day + 1).DayOfWeek;
            //填滿空格
            for (int i = 0; i < j; i++)
                dt_calendar.Rows.Add("");

            //產生該月的日期列表
            for (int i = 1; i <= DateTime.DaysInMonth(datetime.Year, datetime.Month); i++)
            {
                DataRow dr = dt_calendar.NewRow();
                dr[0] = i.ToString();
                List<TempClass> _tempClassList = new List<TempClass>();


                foreach (DataRow r in dt_course.Rows)
                {
                    Regex regex = new Regex(@"\d{2}:\d{2}");
                    TempClass _tempclass = new TempClass((DateTime)r["StartDate"], (DateTime)r["EndDate"], $"{r["C_Name"]} {r["Place_Name"]} {regex.Match(r["StartTime"].ToString())}");
                    if (!_tempClassList.Contains(_tempclass))
                        _tempClassList.Add(_tempclass);
                }
                string _tmpstr = string.Empty;

                foreach (TempClass tempclass in _tempClassList)
                {
                    if (tempclass.Check(DateTime.Parse($"{datetime.Year}/{datetime.Month}/{i}")))
                    {
                        _tmpstr += $"{tempclass.ClassName}<br>";
                    }
                }
                dr[1] = _tmpstr;
                dt_calendar.Rows.Add(dr);
            }

            //資料綁定
            Calendar.DataSource = dt_calendar;
            Calendar.DataBind();

            //設定當天顏色
            if (datetime.ToString("yyyy/MM") == DateTime.Now.ToString("yyyy/MM"))
                Calendar.Items[datetime.Day + j - 1].BackColor = Color.LightPink;
        }

        protected void Calendar_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            DataTable dt_calendar = new DataTable();
            //DataTable dt_course = new DataTable();
            dt_calendar.Columns.Add(new DataColumn("Date"));
            dt_calendar.Columns.Add(new DataColumn("Course"));
            dt_calendar.Columns.Add(new DataColumn("Place"));
            dt_calendar.Columns.Add(new DataColumn("StartTime"));
            int j = (int)DateTime.Now.AddDays(-DateTime.Now.Day + 1).DayOfWeek;
            //填滿空格
            for (int i = 0; i < j; i++)
                dt_calendar.Rows.Add("");

            //產生該月的日期列表
            for (int i = 1; i <= DateTime.DaysInMonth(datetime.Year, datetime.Month); i++)
            {
                DataRow dr = dt_calendar.NewRow();
                dr[0] = i.ToString();
                dr[1] = "";
                dr[2] = "";
                dr[3] = "";

                dt_calendar.Rows.Add(dr);
            }

            //資料綁定
            Calendar.DataSource = dt_calendar;
            Calendar.DataBind();

            //設定當天顏色
            Calendar.Items[DateTime.Now.Day + j - 1].BackColor = Color.LightPink;
        }
    }

    class TempClass
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DayOfWeek DayOfWeek { get; set; }
        public string ClassName { get; set; }

        public TempClass() { }
        public TempClass(DateTime startdate, DateTime enddate, string classname)
        {
            StartDate = startdate;
            EndDate = enddate;
            ClassName = classname;
            DayOfWeek = startdate.DayOfWeek;
        }

        public bool Check(DateTime date)
        {
            if (date.DayOfWeek != DayOfWeek)
                return false;
            if (date >= StartDate && date <= EndDate)
                return true;
            return false;
        }
    }

}