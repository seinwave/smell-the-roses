import * as d3 from 'd3';

// window.onload = function () {
//   const svg = document.getElementById('garden-segment');

//   const colors = ['red', 'purple', 'pink', 'orange', 'yellow', 'white'];

//   // outer loop -- 10 rows
//   for (let i = 0; i < 10; i++) {
//     const row = i * 70 + 7.5;

//     // inner loop -- 5 columns
//     for (let k = 0; k < 5; k++) {
//       const plant = document.createElementNS(
//         'http://www.w3.org/2000/svg',
//         'circle'
//       );
//       const randomColor = colors[Math.floor(Math.random() * colors.length)];
//       plant.setAttribute('r', '5');
//       plant.setAttribute('stroke', 'black');
//       plant.setAttribute('fill', randomColor);
//       plant.setAttribute('cy', row);
//       plant.setAttribute('cx', 15 * k + 7.5);
//       plant.addEventListener('click', function () {
//         alert(`You clicked on a ${randomColor} rose plant!`);
//       });
//       svg.appendChild(plant);
//     }
//   }
// };

// const svg = d3.select('#garden-segment');

// console.log({ svg });

// const zoom = d3.zoom().scaleExtent([1, 10]).on('zoom', zoomed);

// function zoomed(event) {
//   svg.attr('transform', event.transform.toString());
// }
// svg.call(zoom);

// Your GeoJSON data
let geojson = {
  type: 'Feature',
  properties: { Name: 'b3-sector' },
  geometry: {
    type: 'Polygon',
    coordinates: [
      [
        [-73.9652297, 40.6690291],
        [-73.9651801, 40.6690199],
        [-73.9651291, 40.6691593],
        [-73.9651794, 40.6691692],
        [-73.9652297, 40.6690291],
      ],
    ],
  },
};

const flowers = [
  {
    type: 'Feature',
    properties: { Name: 'borderer' },
    geometry: { type: 'Point', coordinates: [-73.965168, 40.6691631] },
  },
  {
    type: 'Feature',
    properties: { Name: 'borderer' },
    geometry: { type: 'Point', coordinates: [-73.9651778, 40.6691644] },
  },
  {
    type: 'Feature',
    properties: { Name: 'borderer' },
    geometry: { type: 'Point', coordinates: [-73.965156, 40.6691611] },
  },
  {
    type: 'Feature',
    properties: { Name: 'borderer' },
    geometry: { type: 'Point', coordinates: [-73.9651459, 40.6691593] },
  },
  {
    type: 'Feature',
    properties: { Name: 'limoncello' },
    geometry: { type: 'Point', coordinates: [-73.9651795, 40.669156] },
  },
  {
    type: 'Feature',
    properties: { Name: 'borderer' },
    geometry: { type: 'Point', coordinates: [-73.9651349, 40.6691568] },
  },
  {
    type: 'Feature',
    properties: { Name: 'limoncello' },
    geometry: { type: 'Point', coordinates: [-73.9651613, 40.6691525] },
  },
  {
    type: 'Feature',
    properties: { Name: 'limoncello' },
    geometry: { type: 'Point', coordinates: [-73.9651509, 40.6691509] },
  },
  {
    type: 'Feature',
    properties: { Name: 'limoncello' },
    geometry: { type: 'Point', coordinates: [-73.965171, 40.6691543] },
  },
  {
    type: 'Feature',
    properties: { Name: 'mother of pearl\n' },
    geometry: { type: 'Point', coordinates: [-73.9651818, 40.6691507] },
  },
  {
    type: 'Feature',
    properties: { Name: 'limoncello' },
    geometry: { type: 'Point', coordinates: [-73.9651402, 40.6691484] },
  },
  {
    type: 'Feature',
    properties: { Name: 'mother of pearl' },
    geometry: { type: 'Point', coordinates: [-73.9651734, 40.6691486] },
  },
  {
    type: 'Feature',
    properties: { Name: 'mother of pearl' },
    geometry: { type: 'Point', coordinates: [-73.9651432, 40.6691416] },
  },
  {
    type: 'Feature',
    properties: { Name: 'mother of pearl' },
    geometry: { type: 'Point', coordinates: [-73.965163, 40.6691467] },
  },
  {
    type: 'Feature',
    properties: { Name: 'mother of pearl' },
    geometry: { type: 'Point', coordinates: [-73.9651536, 40.6691441] },
  },
  {
    type: 'Feature',
    properties: { Name: 'first crush\n' },
    geometry: { type: 'Point', coordinates: [-73.9651852, 40.6691432] },
  },
  {
    type: 'Feature',
    properties: { Name: 'first crush' },
    geometry: { type: 'Point', coordinates: [-73.9651764, 40.6691408] },
  },
  {
    type: 'Feature',
    properties: { Name: 'first crush' },
    geometry: { type: 'Point', coordinates: [-73.9651667, 40.6691383] },
  },
  {
    type: 'Feature',
    properties: { Name: 'first crush' },
    geometry: { type: 'Point', coordinates: [-73.965156, 40.669136] },
  },
  {
    type: 'Feature',
    properties: { Name: 'coral knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651797, 40.6691337] },
  },
  {
    type: 'Feature',
    properties: { Name: 'first crush' },
    geometry: { type: 'Point', coordinates: [-73.9651459, 40.669134] },
  },
  {
    type: 'Feature',
    properties: { Name: 'coral knock out\n' },
    geometry: { type: 'Point', coordinates: [-73.9651877, 40.669135] },
  },
  {
    type: 'Feature',
    properties: { Name: 'coral knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651693, 40.6691317] },
  },
  {
    type: 'Feature',
    properties: { Name: 'coral knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651596, 40.6691292] },
  },
  {
    type: 'Feature',
    properties: { Name: 'coral knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651485, 40.6691264] },
  },
  {
    type: 'Feature',
    properties: { Name: 'peachy knock out\n' },
    geometry: { type: 'Point', coordinates: [-73.9651844, 40.6691277] },
  },
  {
    type: 'Feature',
    properties: { Name: 'peachy knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651757, 40.6691254] },
  },
  {
    type: 'Feature',
    properties: { Name: 'peachy knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651602, 40.669122] },
  },
  {
    type: 'Feature',
    properties: { Name: 'peachy knock out' },
    geometry: { type: 'Point', coordinates: [-73.9651512, 40.6691205] },
  },
  {
    type: 'Feature',
    properties: { Name: 'dakota sun' },
    geometry: { type: 'Point', coordinates: [-73.9651555, 40.6691134] },
  },
  {
    type: 'Feature',
    properties: { Name: 'dakota sun\n' },
    geometry: { type: 'Point', coordinates: [-73.9651924, 40.6691202] },
  },
  {
    type: 'Feature',
    properties: { Name: 'dakota sun' },
    geometry: { type: 'Point', coordinates: [-73.9651703, 40.6691157] },
  },
  {
    type: 'Feature',
    properties: { Name: 'fred loads\n' },
    geometry: { type: 'Point', coordinates: [-73.965186, 40.6691093] },
  },
  {
    type: 'Feature',
    properties: { Name: 'fred loads\n' },
    geometry: { type: 'Point', coordinates: [-73.9651669, 40.669106] },
  },
  {
    type: 'Feature',
    properties: { Name: 'fred loads' },
    geometry: { type: 'Point', coordinates: [-73.9651579, 40.6691042] },
  },
  {
    type: 'Feature',
    properties: { Name: 'frau karl droschki' },
    geometry: { type: 'Point', coordinates: [-73.9651797, 40.6690991] },
  },
  {
    type: 'Feature',
    properties: { Name: 'frau karl droschki\n' },
    geometry: { type: 'Point', coordinates: [-73.9651998, 40.6691027] },
  },
  {
    type: 'Feature',
    properties: { Name: 'marie parie' },
    geometry: { type: 'Point', coordinates: [-73.9651857, 40.6690801] },
  },
  {
    type: 'Feature',
    properties: { Name: 'nearly wild\n' },
    geometry: { type: 'Point', coordinates: [-73.9652025, 40.6690953] },
  },
  {
    type: 'Feature',
    properties: { Name: 'nearly wild\n' },
    geometry: { type: 'Point', coordinates: [-73.9651917, 40.6690933] },
  },
  {
    type: 'Feature',
    properties: { Name: 'nearly wild' },
    geometry: { type: 'Point', coordinates: [-73.9651713, 40.6690895] },
  },
  {
    type: 'Feature',
    properties: { Name: 'nearly wild\n' },
    geometry: { type: 'Point', coordinates: [-73.9651813, 40.6690908] },
  },
  {
    type: 'Feature',
    properties: { Name: 'marie parie\n' },
    geometry: { type: 'Point', coordinates: [-73.9651605, 40.6690872] },
  },
  {
    type: 'Feature',
    properties: { Name: 'marie parie' },
    geometry: { type: 'Point', coordinates: [-73.9652058, 40.6690856] },
  },
  {
    type: 'Feature',
    properties: { Name: 'marie parie' },
    geometry: { type: 'Point', coordinates: [-73.9651957, 40.6690827] },
  },
  {
    type: 'Feature',
    properties: { Name: 'good show\n' },
    geometry: { type: 'Point', coordinates: [-73.9651652, 40.6690755] },
  },
  {
    type: 'Feature',
    properties: { Name: 'marie parie' },
    geometry: { type: 'Point', coordinates: [-73.9651749, 40.6690775] },
  },
  {
    type: 'Feature',
    properties: { Name: 'sea foam\n' },
    geometry: { type: 'Point', coordinates: [-73.9652095, 40.6690744] },
  },
  {
    type: 'Feature',
    properties: { Name: 'sea foam' },
    geometry: { type: 'Point', coordinates: [-73.965189, 40.6690699] },
  },
  {
    type: 'Feature',
    properties: { Name: 'sea foam\n' },
    geometry: { type: 'Point', coordinates: [-73.9651991, 40.6690722] },
  },
  {
    type: 'Feature',
    properties: { Name: 'sea foam' },
    geometry: { type: 'Point', coordinates: [-73.9651797, 40.6690666] },
  },
  {
    type: 'Feature',
    properties: { Name: 'sea foam' },
    geometry: { type: 'Point', coordinates: [-73.9651693, 40.6690643] },
  },
  {
    type: 'Feature',
    properties: { Name: 'eternal flame' },
    geometry: { type: 'Point', coordinates: [-73.9651881, 40.6690475] },
  },
  {
    type: 'Feature',
    properties: { Name: 'the fawn\n' },
    geometry: { type: 'Point', coordinates: [-73.9651934, 40.6690602] },
  },
  {
    type: 'Feature',
    properties: { Name: 'the fawn\n' },
    geometry: { type: 'Point', coordinates: [-73.9652112, 40.669063] },
  },
  {
    type: 'Feature',
    properties: { Name: 'eternal flame' },
    geometry: { type: 'Point', coordinates: [-73.9651783, 40.6690457] },
  },
  {
    type: 'Feature',
    properties: { Name: 'eternal flame\n' },
    geometry: { type: 'Point', coordinates: [-73.9652142, 40.6690531] },
  },
  {
    type: 'Feature',
    properties: { Name: 'eternal flame' },
    geometry: { type: 'Point', coordinates: [-73.9651984, 40.6690488] },
  },
  {
    type: 'Feature',
    properties: { Name: 'white pet' },
    geometry: { type: 'Point', coordinates: [-73.965185, 40.6690282] },
  },
  {
    type: 'Feature',
    properties: { Name: 'oh happy day\n' },
    geometry: { type: 'Point', coordinates: [-73.9652182, 40.6690442] },
  },
  {
    type: 'Feature',
    properties: { Name: 'oh happy day' },
    geometry: { type: 'Point', coordinates: [-73.9652095, 40.6690427] },
  },
  {
    type: 'Feature',
    properties: { Name: 'white pet' },
    geometry: { type: 'Point', coordinates: [-73.9651961, 40.6690302] },
  },
  {
    type: 'Feature',
    properties: { Name: 'oh happy day' },
    geometry: { type: 'Point', coordinates: [-73.9652012, 40.6690402] },
  },
  {
    type: 'Feature',
    properties: { Name: 'oh happy day' },
    geometry: { type: 'Point', coordinates: [-73.9651813, 40.6690374] },
  },
  {
    type: 'Feature',
    properties: { Name: 'white pet\n' },
    geometry: { type: 'Point', coordinates: [-73.9652051, 40.6690318] },
  },
  {
    type: 'Feature',
    properties: { Name: 'dakota sun' },
    geometry: { type: 'Point', coordinates: [-73.9651824, 40.6691185] },
  },
];

// Define the size of the SVG
let width = 960,
  height = 500;

// Define the projection
let projection = d3
  .geoMercator()
  .rotate([73.9652297, -40.6690291, 14.2])
  .fitSize([width, height], geojson);

// Define the path generator
let path = d3.geoPath().projection(projection);

// Create an SVG
let svg = d3
  .select('body')
  .append('svg')
  .attr('width', width)
  .attr('height', height);

// Append the GeoJSON data to the SVG
svg.append('path').datum(geojson).attr('d', path);

svg.attr('fill', 'none').attr('stroke', 'black');

flowers.forEach((flower) => {
  svg
    .append('circle')
    .attr('cx', projection(flower.geometry.coordinates)[0])
    .attr('cy', projection(flower.geometry.coordinates)[1])
    .attr('r', 5)
    .attr('fill', 'red');
});
