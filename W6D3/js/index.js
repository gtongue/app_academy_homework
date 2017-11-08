console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
  type: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function (response) {
    console.log("done!");
    console.log(response);
  },
  error(){
    console.log("error");
  }
});
// Add another console log here, outside your AJAX request
console.log('Hello from outside the AJAX request')
