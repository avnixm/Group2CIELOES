using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace g2cieloes.Admin
{
    public partial class lessons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLessonTable();
                PopulateLessonTypesDropDown();
            }
        }

        protected void SaveLesson_Click(object sender, EventArgs e)
        {
            string title = lessonTitle.Text;
            string type = lessonType.SelectedValue;

            if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(type))
            {
                SaveLessonToDatabase(title, type);
                BindLessonTable();
                PopulateLessonTypesDropDown();
                lblMessage.Text = "Lesson saved successfully.";
            }
            else
            {
                lblMessage.Text = "Please enter a lesson title and select a lesson type.";
            }
        }

        private void SaveLessonToDatabase(string title, string type)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            string query = "INSERT INTO lesson (LessonTitle, LessonType, DateAdded, adminID) VALUES (@LessonTitle, @LessonType, @DateAdded, @AdminID)";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LessonTitle", title);
                    command.Parameters.AddWithValue("@LessonType", type);
                    command.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                    command.Parameters.AddWithValue("@AdminID", 1);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void BindLessonTable()
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            string query = "SELECT LessonID, LessonTitle, LessonType, DateAdded FROM lesson";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    connection.Open();
                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        LessonTable.DataSource = dt;
                        LessonTable.DataBind();
                    }
                }
            }
        }

        protected void LessonTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewQuestionsClick")
            {
                Response.Redirect("viewquestions.aspx");
            }
        }

        private void PopulateLessonTypesDropDown()
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";

            string query = "SELECT DISTINCT LessonType FROM lesson";

            DataTable dt = new DataTable();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    connection.Open();

                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            getfromdatabasethelessontypethenaddthemhere.DataSource = dt;
            getfromdatabasethelessontypethenaddthemhere.DataTextField = "LessonType";
            getfromdatabasethelessontypethenaddthemhere.DataValueField = "LessonType";
            getfromdatabasethelessontypethenaddthemhere.DataBind();

            getfromdatabasethelessontypethenaddthemhere.Items.Insert(0, new ListItem("--Select Lesson Type--", ""));
        }

        protected void savequestion_Click(object sender, EventArgs e)
        {
            string selectedLessonType = getfromdatabasethelessontypethenaddthemhere.SelectedValue;

            int lessonID = GetLessonIDByLessonType(selectedLessonType);

            if (lessonID != -1)
            {
                int questionID = InsertQuestionIntoDatabase(question.Text, lessonID);

                InsertOptionsIntoDatabase(questionID, option1.Text, false);
                InsertOptionsIntoDatabase(questionID, option2.Text, false);
                InsertOptionsIntoDatabase(questionID, option3.Text, false);

                InsertOptionsIntoDatabase(questionID, rightanswer.Text, true);

                Response.Write("Question and options saved successfully.");
            }
            else
            {
                Response.Write("Failed to retrieve LessonID for the selected LessonType.");
            }
        }

        private int InsertQuestionIntoDatabase(string questionText, int lessonID)
        {
            int questionID = -1;

            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";

            string query = "INSERT INTO question (QuestionText, lessonID) VALUES (@QuestionText, @LessonID); SELECT LAST_INSERT_ID();";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@QuestionText", questionText);
                    command.Parameters.AddWithValue("@LessonID", lessonID);

                    connection.Open();

                    questionID = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return questionID;
        }

        private void InsertOptionsIntoDatabase(int questionID, string optionText, bool isCorrect)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            string query = "INSERT INTO choice (QuestionID, ChoiceText, IsCorrect) VALUES (@QuestionID, @ChoiceText, @IsCorrect)";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@QuestionID", questionID);
                    command.Parameters.AddWithValue("@ChoiceText", optionText);
                    command.Parameters.AddWithValue("@IsCorrect", isCorrect);

                    connection.Open();

                    command.ExecuteNonQuery();
                }
            }
        }


        private int GetLessonIDByLessonType(string lessonType)
        {
            int lessonID = -1;

            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";

            string query = "SELECT lessonID FROM lesson WHERE LessonType = @LessonType";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {

                    command.Parameters.AddWithValue("@LessonType", lessonType);

                    connection.Open();

                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        lessonID = Convert.ToInt32(result);
                    }
                }
            }

            return lessonID;
        }

    }
}