<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson4.aspx.cs" Inherits="g2cieloes.lessons.lesson4" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Content/lesson4.css" />
    <title>Object Identification Quiz</title>
  
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
            const correctAnswers = ['dog', 'cat', 'lion', 'elephant', 'monkey', 'rabbit', 'bear', 'penguin', 'giraffe', 'zebra'];
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

            fetch('update-xp.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ xp: score })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('XP updated successfully!');
                } else {
                    alert('Failed to update XP: ' + data.message);
                }
            })
            .catch(error => console.error('Error:', error));
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
            window.location.href = '../learn.aspx'; // Change this to the actual path of your dashboard page
        }

     </script>
</head>
<body>
   
    <div class="questions-container">
        <div class="question  active">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Dog.jpg" alt="Dog" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(0, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(0, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(0, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(0, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Cat.jpg" alt="Cat" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(1, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(1, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(1, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(1, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Lion.jpg" alt="Lion" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(2, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(2, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(2, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(2, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Elephant.jpg" alt="Elephant" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(3, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(3, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(3, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(3, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Monkey.jpg" alt="Monkey" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(4, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(4, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(4, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(4, 'monkey')">Monkey</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Rabbit.jpg" alt="Rabbit" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(5, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(5, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(5, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(5, 'rabbit')">Rabbit</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Bear.jpg" alt="Bear" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(6, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(6, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(6, 'bear')">Bear</div>
                <div class="button" onclick="showNextQuestion(6, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/PENGUIN.jpg" alt="Penguin" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(7, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(7, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(7, 'penguin')">Penguin</div>
                <div class="button" onclick="showNextQuestion(7, 'elephant')">Elephant</div>
            </div>
        </div>
        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/Giraffe.jpg" alt="Giraffe" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(8, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(8, 'giraffe')">Giraffe</div>
                <div class="button" onclick="showNextQuestion(8, 'lion')">Lion</div>
                <div class="button" onclick="showNextQuestion(8, 'elephant')">Elephant</div>
            </div>
        </div>

        <div class="question">
            <h1>Can you tell me what is shown in the image?</h1>
            <img src="lesson images/ZEBRA.jpg" alt="Zebra" class="object-image">
            <div class="button-container">
                <div class="button" onclick="showNextQuestion(9, 'dog')">Dog</div>
                <div class="button" onclick="showNextQuestion(9, 'cat')">Cat</div>
                <div class="button" onclick="showNextQuestion(9, 'zebra')">Zebra</div>
                <div class="button" onclick="showNextQuestion(9, 'elephant')">Elephant</div>
            </div>
        </div>

        <p class="done-message">You've answered all the questions. See your score below.</p>
    <div class="results"></div>
    <div class="button-result">
        <button class="button" onclick="goToDashboard()">Go to Dashboard</button>
    </div>
</body>
</html>

