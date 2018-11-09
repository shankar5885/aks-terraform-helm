import express from 'express';
import morgan from 'morgan';

async function main(port) {

  // setup service
  console.log('starting service...');
  let app = express();

  // setup logging
  app.use(morgan('combined'));

  // serve files
  app.use('/', express.static(__dirname + '/../../src/frontend'));

  // listen
  app.listen(port, '0.0.0.0');
  console.log(`Running on http://localhost:${port}`);
}

main(8888)
  .then(function () {
    console.log('done!');
  })
  .catch(function (error) {
    console.log('error:', error);
  });
