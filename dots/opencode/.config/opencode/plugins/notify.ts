export const NotifyPlugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await $`osascript -e 'display notification "Finished working on your prompt" with title "opencode" sound name "Glass"'`
      }
      if (event.type === "permission.asked") {
        await $`osascript -e 'display notification "Needs your attention (permission)" with title "opencode" sound name "Glass"'`
      }
      if (event.type === "session.error") {
        await $`osascript -e 'display notification "Session error — needs attention" with title "opencode" sound name "Glass"'`
      }
    },
  }
}
