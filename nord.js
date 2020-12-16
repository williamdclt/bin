#!/usr/bin/env node

const ConsoleGrid = require('console-grid');
var col = ConsoleGrid.Style;

var grid = new ConsoleGrid();
var data = {
  columns: [
    {
      id: 'name',
      name: 'Name',
      type: 'string',
      maxWidth: 38,
    },
    {
      id: 'hexa',
      name: 'Hexa',
      type: 'string',
      maxWidth: 7,
      formatter: (v, row, column) => {
        return v;
      },
    },
  ],
  rows: [
    {
      name: 'Blacks',
      value: '',
      subs: [
        {
          name: 'Black 1',
          hexa: '#2e3440',
        },
        {
          name: col.bg.black('Black 2'),
          hexa: '#3b4252',
        },
        {
          name: col.bg.black('Black 3'),
          hexa: '#434c5e',
        },
        {
          name: col.bg.black('Black 4'),
          hexa: '#4c566a',
        },
      ],
    },
    {
      name: 'Colors',
      value: '',
      subs: [
        {
          name: 'Red',
          hexa: '#bf616a',
        },
        {
          name: 'Orange',
          hexa: '#d08770',
        },
        {
          name: 'Yellow',
          hexa: '#ebcb8b',
        },
        {
          name: 'Green',
          hexa: '#a3be8c',
        },
        {
          name: 'Purple',
          hexa: '#b48ead',
        },
      ],
    },
  ],
};
//returns lines could be saved to log file
grid.render(data);
