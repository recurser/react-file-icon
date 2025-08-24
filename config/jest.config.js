module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['./jest.setup.js'],
  transform: {
    '\\.js$': ['babel-jest', { configFile: './config/babel.config.js' }],
  },
  roots: ['../'],
};
