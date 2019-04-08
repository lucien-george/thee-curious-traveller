import places from 'places.js';

const initAutocomplete = () => {
  const tripDestination = document.getElementById('trip_destination');
  if (tripDestination) {
    places({ container: tripDestination });
  }
};

initAutocomplete();
