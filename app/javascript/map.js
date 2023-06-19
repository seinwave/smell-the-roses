import * as d3 from 'd3';

// const zoom = d3.zoom().scaleExtent([1, 10]).on('zoom', zoomed);

// function zoomed(event) {
//   svg.attr('transform', event.transform.toString());
// }
// svg.call(zoom);

const sectorHead = document.getElementById('sector-head');
console.log({ sectorHead });
const sector = JSON.parse(
  document.getElementById('sector-head').dataset.sector
);
const plants = JSON.parse(
  document.getElementById('sector-head').dataset.plants
);

// The raw geoJSON object from the db
let geojson = JSON.parse(sector.geojson_string);

// The size of the svg
let width = 960,
  height = 500;

// the skew of the map, to correct for a slight NW orientation
let projection = d3
  .geoMercator()
  .rotate([73.9652297, -40.6690291, 14.2])
  .fitSize([width, height], geojson);

// The path generator
let path = d3.geoPath().projection(projection);

let svg = d3
  .select('body')
  .append('svg')
  .attr('width', width)
  .attr('height', height);

svg.append('path').datum(geojson).attr('d', path);

svg.attr('fill', 'none').attr('stroke', 'black');

plants.forEach((plant) => {
  const lat = plant.latitude;
  const long = plant.longitude;

  const coordinates = [long, lat];

  console.log({ coordinates });
  console.log(projection(coordinates));
  svg
    .append('circle')
    .attr('cx', projection(coordinates)[0])
    .attr('cy', projection(coordinates)[1])
    .attr('r', 5)
    .attr('fill', 'red');
});
