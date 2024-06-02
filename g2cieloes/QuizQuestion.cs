using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace g2cieloes
{
    public class QuizQuestion
    {
        public string Question { get; set; }
        public List<string> Options { get; set; }
        public string Correct { get; set; }
        public string Picture { get; set; }
        public string OptionsColor { get; set; } // Add the optionsColor property

        public QuizQuestion(string question, List<string> options, string correct, string picture, string optionsColor)
        {
            Question = question;
            Options = options;
            Correct = correct;
            Picture = picture;
            OptionsColor = optionsColor; // Initialize the optionsColor property
        }

    }
}