# harbor-proxy
harbor api proxy

This is a workaround for the OIDC mode call api

I want to update repository description in the CI process. For OIDC mode harbor, user need to get OIDC `id token`, then use `-H "Authorization: Bearer idToken"` to call api. But I don't know how to get `id token`, so I made this workaround.

## Todo

- [x] PUT /repositories/{repo_name}
