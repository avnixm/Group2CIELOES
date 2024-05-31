<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson3.aspx.cs" Inherits="g2cieloes.lesson3" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shape Quiz</title>
    <link rel="stylesheet" href="../Content/lesson3.css" />
    <script>
        let answers = [];
        let resultsShown = false;

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
                showFinalResults();
            }
        }

        function showResults() {
            const correctAnswers = ['circle', 'square', 'triangle', 'rectangle', 'star', 'Heart', 'pentagon', 'hexagon', 'octagon', 'diamond'];
            let score = 0;
            answers.forEach((answer, index) => {
                if (answer === correctAnswers[index]) {
                    score++;
                }
            });
            const resultsDiv = document.querySelector('.results');
            resultsDiv.innerHTML = `<h2>Quiz Results</h2><h3>Your Score: ${score}/${answers.length}</h3>`;
            console.log(`Final Score: ${score}`);
            return score;
        }

        function submitResults(score) {
            const userId = getUserId();

            console.log("Submitting score:", score);

            fetch('lesson3.aspx/UpdateXP', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ UserXP: score, userId: parseInt(userId) }), // Ensure userId is an integer
                credentials: 'include'
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.d && data.d.success) {
                        alert('XP updated successfully!');
                    } else {
                        alert('Failed to update XP: ' + (data.d ? data.d.message : 'Unknown error'));
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert(`Failed to update XP: ${error.message}`);
                });
        }

        function getUserId() {
            // Function to retrieve the user ID
            return document.getElementById('userId').value;
        }

        function showFinalResults() {
            if (!resultsShown) {
                const score = showResults();
                document.querySelector('.results').style.display = 'block';
                document.querySelector('.button-result').style.display = 'flex';
                submitResults(score);
                resultsShown = true;
            } else {
                alert('Results have already been shown and XP updated.');
            }
        }

        function goToDashboard() {
            window.location.href = '../learn.aspx';
        }
    </script>
</head>
<body>
    <input type="hidden" id="userId" value="<%= Session["User"] %>" />
    <div class="question active">
        <h1>What shape do you see?</h1>
        <img src="lesson images/Circle1.png" alt="Circle" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(0, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(0, 'square')">Square</div>
            <div class="button" onclick="showNextQuestion(0, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(0, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/square.png" alt="Square" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(1, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(1, 'square')">Square</div>
            <div class="button" onclick="showNextQuestion(1, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(1, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/triangle.png" alt="Triangle" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(2, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(2, 'square')">Square</div>
            <div class="button" onclick="showNextQuestion(2, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(2, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/rectangle.png" alt="Rectangle" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(3, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(3, 'square')">Square</div>
            <div class="button" onclick="showNextQuestion(3, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(3, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/star.png" alt="Star" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(4, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(4, 'star')">Star</div>
            <div class="button" onclick="showNextQuestion(4, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(4, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see in the Picture?</h1>
        <img src="lesson images/Heart1.png" alt="Heart" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(5, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(5, 'Heart')">Heart</div>
            <div class="button" onclick="showNextQuestion(5, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(5, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/pentagon.png" alt="Pentagon" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(6, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(6, 'pentagon')">Pentagon</div>
            <div class="button" onclick="showNextQuestion(6, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(6, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/hexagon.png" alt="Hexagon" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(7, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(7, 'hexagon')">Hexagon</div>
            <div class="button" onclick="showNextQuestion(7, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(7, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/octagon.png" alt="Octagon" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(8, 'circle')">Circle</div>
            <div class="button" onclick="showNextQuestion(8, 'octagon')">Octagon</div>
            <div class="button" onclick="showNextQuestion(8, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(8, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="question">
        <h1>What shape do you see?</h1>
        <img src="lesson images/diamond.png" alt="Diamond" class="shape-image">
        <div class="button-container">
            <div class="button" onclick="showNextQuestion(9, 'diamond')">Diamond</div>
            <div class="button" onclick="showNextQuestion(9, 'hexagon')">Hexagon</div>
            <div class="button" onclick="showNextQuestion(9, 'triangle')">Triangle</div>
            <div class="button" onclick="showNextQuestion(9, 'rectangle')">Rectangle</div>
        </div>
    </div>
    <div class="done-message">
        <h1>Done!</h1>
        <div class="results"></div>
        <div class="button-result">
            <button class="button" onclick="goToDashboard()">Go to Dashboard</button>
        </div>
    </div>
</body>
</html>
