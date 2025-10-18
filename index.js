/**
 * HTTP Cloud Function.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
module.exports.helloWorld = (req, res) => {
  res.send('Hello from GCF');
};