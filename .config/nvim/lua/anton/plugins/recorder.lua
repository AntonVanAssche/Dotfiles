return {
  "chrisgrieser/nvim-recorder",
  opts = {
    slots = { "a", "b" },
    mapping = {
      startStopRecording = "q",
      playMacro = "Q",
      switchSlot = "<C-q>",
      editMacro = "cq",
      deleteAllMacros = "dq",
      yankMacro = "yq",
      addBreakPoint = "##",
    },
  },
}
