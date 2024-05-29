document.addEventListener('DOMContentLoaded', function () {
    function showPopup() {
        const popup = document.getElementById('languagePopup');
        if (popup) {
            popup.style.display = 'block';
        } else {
            console.error('Popup element not found.');
        }
    }

    function applySelection() {
        const language = document.getElementById('language').value;
        const currency = document.getElementById('currency').value;

        // Update header content based on selected language and currency
        // Modify this part according to your implementation
        document.querySelector('.language_option').innerText = `${language} | ${currency}`;

        // Hide the popup
        const popup = document.getElementById('languagePopup');
        if (popup) {
            popup.style.display = 'none';
        } else {
            console.error('Popup element not found.');
        }
    }
});
