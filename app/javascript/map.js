window.onload = function () {
  const svg = document.getElementById('garden-segment');

  const colors = ['red', 'purple', 'pink', 'orange', 'yellow', 'white'];

  // outer loop -- 10 rows
  for (let i = 0; i < 10; i++) {
    const row = i * 70 + 7.5;

    // inner loop -- 5 columns
    for (let k = 0; k < 5; k++) {
      const plant = document.createElementNS(
        'http://www.w3.org/2000/svg',
        'circle'
      );
      const randomColor = colors[Math.floor(Math.random() * colors.length)];
      plant.setAttribute('r', '5');
      plant.setAttribute('stroke', 'black');
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
