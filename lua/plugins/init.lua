if true then return {} end -- This file's contents have been merged into lazy_setup.lua

return { -- 1. Core LazyVim plugins
{
    import = "lazyvim.plugins"
}, -- 2. Extras (like Prettier and ESLint)
{
    import = "lazyvim.plugins.extras.formatting.prettier"
}, {
    import = "lazyvim.plugins.extras.linting.eslint"
}, {
    import = "lazyvim.plugins.extras.lang.typescript"
}, {
    import = "lazyvim.plugins.extras.lang.json"
}, {
    import = "lazyvim.plugins.extras.lang.yaml"
}, {
    import = "lazyvim.plugins.extras.lang.markdown"
}, {
    import = "lazyvim.plugins.extras.lang.go"
}, {
    import = "lazyvim.plugins.extras.lang.python"
}, {
    import = "lazyvim.plugins.extras.lang.rust"
}, -- 3. Your custom plugins
{
    import = "plugins"
}}
