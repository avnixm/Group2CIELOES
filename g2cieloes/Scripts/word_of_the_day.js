async function fetchWordDetails(word) {
    try {
        const response = await fetch(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`);
        const data = await response.json();

        if (data.length > 0) {
            const entry = data[0];

            // Update part of speech
            const partOfSpeechElement = document.getElementById('partOfSpeech');
            partOfSpeechElement.textContent = entry.meanings[0].partOfSpeech;

            // Update definition
            const definitionElement = document.getElementById('definition');
            definitionElement.textContent = entry.meanings[0].definitions[0].definition;

            // Update audio
            const audioElement = document.getElementById('audio');
            const phonetics = entry.phonetics.filter(ph => ph.audio);
            if (phonetics.length > 0) {
                audioElement.src = phonetics[0].audio;
            } else {
                audioElement.style.display = 'none'; // Hide audio element if no audio available
            }

            const examplesElement = document.getElementById('examples');
            examplesElement.innerHTML = ''; // Clear existing examples
            let examplesAdded = 0;
            entry.meanings.forEach(meaning => {
                meaning.definitions.forEach(definition => {
                    if (definition.example && examplesAdded < 2) {
                        const exampleItem = document.createElement('li');
                        exampleItem.textContent = definition.example;
                        examplesElement.appendChild(exampleItem);
                        examplesAdded++;
                    }
                });
            });


            // Hide examples if no examples found
            if (examplesAdded === 0) {
                examplesElement.style.display = 'none';
            } else {
                examplesElement.style.display = 'block';
            }

            const synonymsElement = document.getElementById('synonymsList');
            synonymsElement.innerHTML = ''; // Clear existing synonyms
            let synonymsAdded = 0;
            entry.meanings.forEach(meaning => {
                if (synonymsAdded >= 3) return; // Exit loop if 3 synonyms already added
                if (meaning.synonyms && meaning.synonyms.length > 0) {
                    meaning.synonyms.slice(0, 3 - synonymsAdded).forEach((synonym, index) => {
                        const synonymItem = document.createElement('span');
                        synonymItem.textContent = synonym;
                        if (index < 2 && synonymsAdded < 2) {
                            synonymItem.textContent += ', ';
                        }
                        synonymsElement.appendChild(synonymItem);
                        synonymsAdded++;
                    });
                }
            });

            // Update text pronunciation
            const textPronunciationElement = document.getElementById('textPronunciation');
            const textPhonetics = entry.phonetics.filter(ph => ph.text);
            if (textPhonetics.length > 0) {
                textPronunciationElement.textContent = textPhonetics[0].text;
            } else {
                textPronunciationElement.textContent = ''; // Clear text pronunciation if not available
            }
        } else {
            console.log('No definitions found for the word.');
        }
    } catch (error) {
        console.error('Error fetching word details:', error);
    }
}



async function fetchWordOfTheDay() {
    try {
        const response = await fetch('Content/Json/wordoftheday.json');
        const data = await response.json();

        const currentDate = new Date().toLocaleDateString('en-US', {
            month: 'long',
            day: 'numeric',
            year: 'numeric'
        });

        const wordOfTheDay = data[currentDate];

        const wordElement = document.getElementById('word');
        wordElement.textContent = wordOfTheDay || 'No word found for today';

        if (wordOfTheDay) {
            fetchWordDetails(wordOfTheDay);
        }
    } catch (error) {
        console.error('Error fetching word of the day:', error);
    }
}

fetchWordOfTheDay();

const playButton = document.getElementById('playButton');
const audio = document.getElementById('audio');

playButton.addEventListener('click', () => {
    if (audio.paused) {
        audio.play();
        playButton.classList.add('fa-pause');
        playButton.classList.remove('fa-play');
    } else {
        audio.pause();
        playButton.classList.remove('fa-pause');
        playButton.classList.add('fa-play');
    }
});
