### Summary

A brief description of the pull request.

### How it works

Screenshots/screencasts of the pull request introduced functionality.

### Test plan

List of steps to manually test introduced functionality:

- Go to http://localhost:3000/graphiql
- Make request using schema:
```graphql
  query {
    me {
      id
      name
    }
  }
```

### Deploy notes

Notes regarding deployment the contained body of work.
These should note any db migrations, services, scripts, etc.

### Checklist:

- [ ] I have performed a self-review of my own code
- [ ] My pull request is shorter than 500 lines
