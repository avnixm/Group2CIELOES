<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson2.aspx.cs" Inherits="g2cieloes.lessons.lesson2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Content/lesson2.css" />
    <title>Fruit Color Quiz</title>
   
</head>

    <script>
    let answers = [];
    let resultsShown = false; // Add a flag to track if results have been shown

    function showNextQuestion(currentIndex, answer) {
        console.log(`Question ${currentIndex + 1}: ${answer}`);
        answers[currentIndex] = answer;
        const questions = document.querySelectorAll('.question');
        if (currentIndex < questions.length - 1) {
            questions[currentIndex].classList.remove('active');
            questions[currentIndex + 1].classList.add('active');
        } else {
            document.querySelector('.done-message').style.display = 'block';
            questions[currentIndex].classList.remove('active');
            showFinalResults(); // Automatically show results
        }
    }

    function showResults() {
        const correctAnswers = ['yellow', 'red', 'blue', 'orange', 'purple', 'yellow', 'red', 'green', 'green', 'red'];
        let score = 0;
        answers.forEach((answer, index) => {
            if (answer === correctAnswers[index]) {
                score++;
            }
        });
        const resultsDiv = document.querySelector('.results');
        resultsDiv.innerHTML = `<h2>Quiz Results</h2>`;
        resultsDiv.innerHTML += `<h3>Your Score: ${score}/${answers.length}</h3>`;
        console.log(`Final Score: ${score}`);
        return score;
    }

    function submitResults(score) {
        console.log("Submitting score:", score);

        fetch('lesson2.aspx/SubmitResults', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ score: score, userId: '@userId' })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('XP updated successfully!');
                } else {
                    alert('Failed to update XP: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred: ' + error.message);
            });
    }

    function showFinalResults() {
        if (!resultsShown) { // Check if results have already been shown
            const score = showResults();
            document.querySelector('.results').style.display = 'block';
            document.querySelector('.button-result').style.display = 'flex'; // Show the button-result div
            submitResults(score);
            resultsShown = true; // Set the flag to true after showing results
        } else {
            alert('Results have already been shown and XP updated.');
        }
    }
        function goToDashboard() {
            window.location.href = '../learn.aspx';
        }
    </script>

<body>
    <form id="form1" runat="server">
        <div class="question active">
        <h1>What color is a banana?</h1>
        <img src="lesson images/BANANA.jpg" alt="Banana" class="fruit-image">
        <div class="button-container">
            <div class="button red" onclick="showNextQuestion(0, 'red')">RED</div>
            <div class="button green" onclick="showNextQuestion(0, 'green')">GREEN</div>
            <div class="button yellow" onclick="showNextQuestion(0, 'yellow')">YELLOW</div>
            <div class="button purple" onclick="showNextQuestion(0, 'purple')">PURPLE</div>
        </div>
    </div>
    <div class="question">
        <h1>What color is an apple?</h1>
        <img src="lesson images/apple.jpg" alt="Apple" class="fruit-image">
        <div class="button-container">
            <div class="button black" onclick="showNextQuestion(1, 'black')">BLACK</div>
            <div class="button blue" onclick="showNextQuestion(1, 'blue')">BLUE</div>
            <div class="button yellow" onclick="showNextQuestion(1, 'yellow')">YELLOW</div>
            <div class="button red" onclick="showNextQuestion(1, 'red')">RED</div>
        </div>
    </div>
    <div class="question">
        <h1>What color is a blueberry?</h1>
        <img src="lesson images/blueberry.jpg" alt="Blueberry" class="fruit-image">
        <div class="button-container">
            <div class="button green" onclick="showNextQuestion(2, 'green')">GREEN</div>
            <div class="button blue" onclick="showNextQuestion(2, 'blue')">BLUE</div>
            <div class="button orange" onclick="showNextQuestion(2, 'orange')">ORANGE</div>
            <div class="button black" onclick="showNextQuestion(2, 'black')">BLACK</div>
        </div>
    </div>
    <div class="question">
        <h1>What color is an orange?</h1>
        <img src="lesson images/Orange.jpg" alt="Orange" class="fruit-image">
        <div class="button-container">
            <div class="button yellow" onclick="showNextQuestion(3, 'yellow')">YELLOW</div>
            <div class="button red" onclick="showNextQuestion(3, 'red')">RED</div>
            <div class="button orange" onclick="showNextQuestion(3, 'orange')">ORANGE</div>
            <div class="button purple" onclick="showNextQuestion(3, 'purple')">PURPLE</div>
        </div>
    </div>
    <div class="question">
        <h1>What color is a grape?</h1>
            <img src="lesson images/Grapes.jpg" alt="Grape" class="fruit-image">
            <div class="button-container">
                <div class="button purple" onclick="showNextQuestion(4, 'purple')">PURPLE</div>
                <div class="button red" onclick="showNextQuestion(4, 'red')">RED</div>
                <div class="button brown" onclick="showNextQuestion(4, 'brown')">BROWN</div>
                <div class="button yellow" onclick="showNextQuestion(4, 'yellow')">YELLOW</div>
            </div>
        </div>
        <div class="question">
            <h1>What color is a lemon?</h1>
            <img src="lesson images/Lemon.jpg" alt="Lemon" class="fruit-image">
            <div class="button-container">
                <div class="button green" onclick="showNextQuestion(5, 'green')">GREEN</div>
                <div class="button yellow" onclick="showNextQuestion(5, 'yellow')">YELLOW</div>
                <div class="button blue" onclick="showNextQuestion(5, 'blue')">BLUE</div>
                <div class="button black" onclick="showNextQuestion(5, 'black')">BLACK</div>
            </div>
        </div>
        <div class="question">
            <h1>What color is a strawberry?</h1>
            <img src="lesson images/stawberry.jpg" alt="Strawberry" class="fruit-image">
            <div class="button-container">
                <div class="button red" onclick="showNextQuestion(6, 'red')">RED</div>
                <div class="button blue" onclick="showNextQuestion(6, 'blue')">BLUE</div>
                <div class="button yellow" onclick="showNextQuestion(6, 'yellow')">YELLOW</div>
                <div class="button green" onclick="showNextQuestion(6, 'green')">GREEN</div>
            </div>
        </div>
        <div class="question">
            <h1>What color is a mango?</h1>
            <img src="lesson images/Mango.jpg" alt="Mango" class="fruit-image">
            <div class="button-container">
                <div class="button orange" onclick="showNextQuestion(7, 'orange')">ORANGE</div>
                <div class="button blue" onclick="showNextQuestion(7, 'blue')">BLUE</div>
                <div class="button green" onclick="showNextQuestion(7, 'green')">GREEN</div>
                <div class="button black" onclick="showNextQuestion(7, 'black')">BLACK</div>
            </div>
        </div>
        <div class="question">
            <h1>What color is a watermelon on the outside?</h1>
            <img src="lesson images/watermelonn.jpg" alt="Watermelon" class="fruit-image">
            <div class="button-container">
                <div class="button red" onclick="showNextQuestion(8, 'red')">RED</div>
                <div class="button green" onclick="showNextQuestion(8, 'green')">GREEN</div>
                <div class="button yellow" onclick="showNextQuestion(8, 'yellow')">YELLOW</div>
                <div class="button purple" onclick="showNextQuestion(8, 'purple')">PURPLE</div>
            </div>
        </div>
        <div class="question">
            <h1>What color is a cherry?</h1>
            <img src="lesson images/cherry.jpg" alt="Cherry" class="fruit-image">
            <div class="button-container">
                <div class="button red" onclick="showNextQuestion(9, 'red')">RED</div>
                <div class="button green" onclick="showNextQuestion(9, 'green')">GREEN</div>
                <div class="button blue" onclick="showNextQuestion(9, 'blue')">BLUE</div>
                <div class="button brown" onclick="showNextQuestion(9, 'brown')">BROWN</div>
            </div>
        </div>
        <p class="done-message">You've answered all the questions. See your score below.</p>
        <div class="results"></div>
        <div class="button-result">
           <button type="button" class="button" onclick="goToDashboard()">Go to Dashboard</button>
        </div>
    </form>
</body>
</html>
