
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

# BAR GRAPH
  data = {
    labels : ["January","February","March","April","May","June","July"],
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : [65,59,90,81,56,55,40]
      },
      {
        fillColor : "rgba(151,187,205,0.5)",
        strokeColor : "rgba(151,187,205,1)",
        pointColor : "rgba(151,187,205,1)",
        pointStrokeColor : "#fff",
        data : [28,48,40,19,96,27,80]
      }
    ]
  }

  myNewChart = new Chart($("#canvasBar").get(0).getContext("2d")).Bar(data);


# LINE GRAPH
  data = {
    labels : ["January","February","March","April","May","June","July"],
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : [65,59,90,81,56,55,40]
      },
      {
        fillColor : "rgba(151,187,205,0.5)",
        strokeColor : "rgba(151,187,205,1)",
        pointColor : "rgba(151,187,205,1)",
        pointStrokeColor : "#fff",
        data : [28,48,40,19,96,27,80]
      }
    ]
  }

  myNewChart = new Chart($("#canvasLine").get(0).getContext("2d")).Line(data);


# PIE GRAPH
  data = [
      {
          value: 300,
          color:"#F7464A",
          highlight: "#FF5A5E",
          label: "Protien"
      },
      {
          value: 50,
          color: "#46BFBD",
          highlight: "#5AD3D1",
          label: "Carb"
      },
      {
          value: 100,
          color: "#FDB45C",
          highlight: "#FFC870",
          label: "Fat"
      }
  ]

  myNewChart = new Chart($("#canvasPie").get(0).getContext("2d")).Pie(data);


  data = [
      {
          value: 300,
          color:"#F7464A",
          highlight: "#FF5A5E",
          label: "Protien"
      },
      {
          value: 500,
          color: "#46BFBD",
          highlight: "#5AD3D1",
          label: "Carb"
      },
      {
          value: 100,
          color: "#FDB45C",
          highlight: "#FFC870",
          label: "Fat"
      }
  ]

  myNewChart = new Chart($("#canvasDoughnut").get(0).getContext("2d")).Doughnut(data);