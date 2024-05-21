return {
  "OscarCreator/rsync.nvim",
  build = "make",
  dependencies = "nvim-lua/plenary.nvim",
  cmd = {
    "RsyncDown",
    "RsyncDownFile",
    "RsyncUp",
    "RsyncUpFile",
    "RsyncLog",
    "RsyncConfig",
    "RsyncProjectConfig",
    "RsyncSaveSync",
  },
  config = true,
}
