using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace g2cieloes.lessons
{
    public partial class lesson4 : System.Web.UI.Page
    {
        private List<QuizQuestion> quizQuestions;
        private int currentQuestionIndex;
        private int score;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserXPAndHearts();
                GetTheUserXP();
                LoadQuizData();
                currentQuestionIndex = 0;
                score = 0;
                Session["CurrentQuestionIndex"] = currentQuestionIndex;
                Session["Score"] = score;
                DisplayQuestion();
            }
        }

        private void DisplayUserXPAndHearts()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                userxpslabel.Text = $"{user.UserXP}";
                userheartslabel.Text = $"{user.UserHearts}";
            }
        }

        private void GetTheUserXP()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                userxptext.Text = $"{user.UserXP}";
            }
        }



        private void LoadQuizData()
        {
            string jsonFilePath = Server.MapPath("~/Content/Json/lesson4.json");
            string jsonData = File.ReadAllText(jsonFilePath);
            quizQuestions = JsonConvert.DeserializeObject<List<QuizQuestion>>(jsonData);
            Session["QuizQuestions"] = quizQuestions;
        }

        private void DisplayQuestion()
        {
            quizQuestions = (List<QuizQuestion>)Session["QuizQuestions"];
            currentQuestionIndex = (int)Session["CurrentQuestionIndex"];
            QuizQuestion question = quizQuestions[currentQuestionIndex];

            QuestionLabel.Text = question.Question;
            OptionsList.Items.Clear();
            foreach (string option in question.Options)
            {
                ListItem listItem = new ListItem(option, option);
                OptionsList.Items.Add(listItem);
            }

            QuestionImage.ImageUrl = question.Picture;

            score = (int)Session["Score"];
            scoreLabel.Text = $"Score: {score}";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            quizQuestions = (List<QuizQuestion>)Session["QuizQuestions"];
            currentQuestionIndex = (int)Session["CurrentQuestionIndex"];
            score = (int)Session["Score"];

            string selectedOption = OptionsList.SelectedValue;
            QuizQuestion question = quizQuestions[currentQuestionIndex];

            if (selectedOption == question.Correct)
            {
                score++;
                Session["Score"] = score;
            }

            currentQuestionIndex++;
            Session["CurrentQuestionIndex"] = currentQuestionIndex;

            if (currentQuestionIndex < quizQuestions.Count)
            {
                DisplayQuestion();
            }
            else
            {
                QuestionPanel.Visible = false;
                scoreLabel.Text = "Final Score: " + score;
                UpdateUserXP(score);
                donebtn.Visible = true;
                SubmitButton.Visible = false;
            }

            scoreLabel.Text = $"Score: {score}";
        }

        private void UpdateUserXP(int finalScore)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                user.UserXP += finalScore;

                string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    string query = "UPDATE userinfo SET user_xp = @UserXP WHERE userID = @UserId";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserXP", user.UserXP);
                    command.Parameters.AddWithValue("@UserId", user.UserId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                userxpslabel.Text = $"{user.UserXP}";

                Session["User"] = user;
            }
        }

        protected void OptionsList_PreRender(object sender, EventArgs e)
        {
            quizQuestions = (List<QuizQuestion>)Session["QuizQuestions"];
            currentQuestionIndex = (int)Session["CurrentQuestionIndex"];
            QuizQuestion question = quizQuestions[currentQuestionIndex];

            Dictionary<string, string> optionColors = new Dictionary<string, string>
                {
                    { "Red", "#FF5733" },
                    { "Green", "#33FF57" },
                    { "Yellow", "#FFFF00" },
                    { "Purple", "#800080" },
                    { "Indigo", "#4B0082" },
                    { "Blue", "#0000FF" },
                    { "Orange", "#FFA500" },
                    { "Brown", "#964B00" }
                };

            foreach (ListItem item in OptionsList.Items)
            {
                string optionValue = item.Value;

                if (optionColors.ContainsKey(optionValue))
                {
                    string color = optionColors[optionValue];

                    item.Attributes.CssStyle.Add("background-color", color);
                    item.Attributes.CssStyle.Add("color", "white");
                    item.Attributes.CssStyle.Add("text-shadow", "-1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000");
                }

                item.Attributes.CssStyle.Add("border", "1px solid black");
                item.Attributes.CssStyle.Add("padding", "10px");
                item.Attributes.CssStyle.Add("margin-bottom", "2%");
                item.Attributes.CssStyle.Add("width", "150px");
                item.Attributes.CssStyle.Add("border-radius", "5px");
                item.Attributes.CssStyle.Add("display", "block");
            }
        }



        protected void donebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Learn.aspx");
        }

    }
}