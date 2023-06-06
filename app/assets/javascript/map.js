window.onload = function () {
  const svg = document.getElementById('garden-segment');

  const colors = ['red', 'purple', 'pink', 'green', 'orange', 'blue'];

  // outer loop -- 50 rows
  for (let i = 0; i < 50; i++) {
    row = i * 15 + 7.5;

    // inner loop -- 5 columns
    for (let k = 0; k < 5; k++) {
      const plant = document.createElementNS(
        'http://www.w3.org/2000/svg',
        'circle'
      );
      const randomColor = colors[Math.floor(Math.random() * colors.length)];
      plant.setAttribute('r', '3');
      plant.setAttribute('fill', randomColor);
      plant.setAttribute('cy', row);
      plant.setAttribute('cx', 15 * k + 7.5);
      plant.addEventListener('click', function () {
        alert(`You clicked on a ${randomColor} rose plant!`);
      });
      svg.appendChild(plant);
    }
  }
};
