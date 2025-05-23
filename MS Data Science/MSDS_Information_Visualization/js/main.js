let globalData = [];
let filteredData = [];
let lineChart, scatterChart, barChart;

Papa.parse("data/cars.csv", {
  download: true,
  header: true,
  dynamicTyping: true,
  complete: function(results) {
    globalData = results.data.filter(d => d.MPG && d.Horsepower && d.Weight && d.Cylinders);
    filteredData = [...globalData];
    updateAllCharts();
  }
});

document.getElementById('originFilter').addEventListener('change', (e) => {
  const val = e.target.value;
  filteredData = val === 'All' ? [...globalData] : globalData.filter(d => d.Origin === val);
  updateAllCharts();
});

function updateAllCharts() {
  updateParallel();
  updateLine();
  updateScatter();
  updateBar();
}

function updateParallel() {
  const dims = ['MPG', 'Horsepower', 'Weight', 'Cylinders'].map(dim => ({
    label: dim,
    values: filteredData.map(d => d[dim]),
    range: [Math.min(...filteredData.map(d => d[dim])), Math.max(...filteredData.map(d => d[dim]))]
  }));

  Plotly.newPlot('parallelChart', [{
    type: 'parcoords',
    line: { color: filteredData.map(d => d.MPG), colorscale: 'Jet' },
    dimensions: dims
  }]);

  document.getElementById('parallelChart').on('plotly_selected', event => {
    if (event) {
      const indices = event.points.map(p => p.pointNumber);
      filteredData = indices.map(i => filteredData[i]);
      updateAllCharts();
    }
  });
}

function updateLine() {
  const years = [...new Set(filteredData.map(d => d["Model Year"]))].sort((a, b) => a - b);
  const avgMPG = years.map(y => {
    const subset = filteredData.filter(d => d["Model Year"] === y);
    return subset.reduce((sum, d) => sum + d.MPG, 0) / (subset.length || 1);
  });

  const data = {
    labels: years,
    datasets: [{
      label: 'Average MPG',
      data: avgMPG,
      borderColor: '#27ae60',
      backgroundColor: 'rgba(39, 174, 96, 0.2)',
      fill: true,
      tension: 0.3
    }]
  };

  const options = {
    responsive: true,
    plugins: {
      zoom: {
        zoom: { wheel: { enabled: true }, mode: 'x' },
        pan: { enabled: true, mode: 'x' }
      }
    },
    scales: {
      x: {
        title: { display: true, text: 'Model Year' },
        grid: { display: false }
      },
      y: {
        title: { display: true, text: 'Average MPG' },
        grid: { display: false }
      }
    },
    onClick: (evt, item) => {
      if (item.length) {
        const year = years[item[0].index];
        filteredData = filteredData.filter(d => d["Model Year"] === year);
        updateLine();
      }
    }
  };

  if (lineChart) lineChart.destroy();
  const ctx = document.getElementById('lineChart').getContext('2d');
  lineChart = new Chart(ctx, { type: 'line', data, options });
}

function updateScatter() {
  const data = {
    datasets: [{
      label: 'Cars',
      data: filteredData.map(d => ({ x: d.Horsepower, y: d.MPG })),
      backgroundColor: 'orange'
    }]
  };

  const options = {
    responsive: true,
    plugins: {
      zoom: {
        zoom: { wheel: { enabled: true }, mode: 'xy' },
        pan: { enabled: true, mode: 'xy' }
      }
    },
    scales: {
      x: {
        title: { display: true, text: 'Horsepower' },
        grid: { display: false }
      },
      y: {
        title: { display: true, text: 'MPG (Miles per Gallon)' },
        grid: { display: false }
      }
    },
    onClick: (evt, item) => {
      if (item.length) {
        const point = item[0].element.$context.raw;
        filteredData = filteredData.filter(d => d.Horsepower === point.x && d.MPG === point.y);
        updateScatter();
      }
    }
  };

  if (scatterChart) scatterChart.destroy();
  const ctx = document.getElementById('scatterChart').getContext('2d');
  scatterChart = new Chart(ctx, { type: 'scatter', data, options });
}

function updateBar() {
  const manufacturers = [...new Set(filteredData.map(d => d.Manufacturer))];
  const origins = ['American', 'Japanese', 'European'];

  const counts = origins.map(origin => ({
    label: origin,
    data: manufacturers.map(m => filteredData.filter(d => d.Origin === origin && d.Manufacturer === m).length)
  }));

  const data = {
    labels: manufacturers,
    datasets: counts
  };

  const options = {
    responsive: true,
    scales: {
      x: {
        stacked: true,
        title: { display: true, text: 'Manufacturer' },
        grid: { display: false }
      },
      y: {
        stacked: true,
        title: { display: true, text: 'Number of Cars' },
        grid: { display: false }
      }
    },
    onClick: (evt, item) => {
      if (item.length) {
        const origin = item[0].dataset.label;
        filteredData = globalData.filter(d => d.Origin === origin);
        document.getElementById('originFilter').value = origin;
        updateBar();
      }
    }
  };

  if (barChart) barChart.destroy();
  const ctx = document.getElementById('barChart').getContext('2d');
  barChart = new Chart(ctx, { type: 'bar', data, options });
}

