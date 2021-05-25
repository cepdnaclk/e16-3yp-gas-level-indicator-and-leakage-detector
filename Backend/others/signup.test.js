const axios = require('axios');

test('User is Karen', () => {
  axios({
    method: 'post',
    url: 'http://localhost:9000/signup',
    data: {
      "email":"kasun@gmail.com",
      "password":"kasun",
      "mobile_number":"0754753217"
  }
  }).then(function (response) {
    expect(response.status).toBe(200);
    console.log(response)
  });
  // expect(user).toBe('Karen');
});