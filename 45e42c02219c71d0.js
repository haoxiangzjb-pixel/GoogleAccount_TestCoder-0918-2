/**
 * Google Cloud Function that returns 'Hello from GCF'
 * @param {Object} req The request object
 * @param {Object} res The response object
 */
exports.helloFromGCF = (req, res) => {
  res.status(200).send('Hello from GCF');
};
