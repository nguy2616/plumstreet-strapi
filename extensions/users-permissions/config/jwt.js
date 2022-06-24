module.exports = {
  jwtSecret: process.env.JWT_SECRET || 'a65dd524-1217-419d-abe2-949790af5702',
  jwt: {
    expiresIn: "1d",
  }
};
