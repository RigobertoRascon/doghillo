function initAutocomplete() {
    // Create the autocomplete object, restricting the search predictions to
    // geographical location types.
    autocomplete = new google.maps.places.Autocomplete(
        document.getElementById('search_input'), { types: ['geocode'] });
    var place = autocomplete.getPlace();

}