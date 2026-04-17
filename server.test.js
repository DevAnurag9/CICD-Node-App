const request = require('supertest');
const app = require('./server');

describe('GET /health endpoint', () => {
  it('should return status 200 and { status: "OK" }', async () => {
    // 1. Make a GET request to the /health endpoint
    const response = await request(app).get('/health');
    
    // 2. Assert that the status code is 200 (OK)
    expect(response.statusCode).toBe(200);
    
    // 3. Assert that the response body matches our expected output
    expect(response.body).toEqual({ status: 'OK' });
  });
});
