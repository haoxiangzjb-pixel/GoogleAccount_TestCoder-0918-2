const { v4: uuidv4 } = require('uuid');
const fs = require('fs');

const data = {
  id: uuidv4(),
  timestamp: new Date().toISOString(),
  status: "success",
  data: {
    users: [
      { id: 1, name: "Alice", email: "alice@example.com" },
      { id: 2, name: "Bob", email: "bob@example.com" }
    ]
  }
};

const filename = `/workspace/api_response_${data.id}.json`;
fs.writeFileSync(filename, JSON.stringify(data, null, 2));
console.log(`Data written to ${filename}`);