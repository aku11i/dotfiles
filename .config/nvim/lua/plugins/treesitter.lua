return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "c", "c_sharp", "clojure", "cpp", "css", "dart", "dockerfile",
        "fish", "go", "gomod", "graphql", "html", "http", "java", "javascript",
        "jsdoc", "kotlin", "lua", "make", "markdown", "nix", "ocaml",
        "python", "ruby", "rust", "scss", "svelte", "swift", "toml", "tsx",
        "typescript", "vim", "vue", "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
