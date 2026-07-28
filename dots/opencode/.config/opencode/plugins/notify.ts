export const NotifyPlugin = async ({ $ }) => {
  const tmuxLocation = async (): Promise<string | null> => {
    if (!process.env.TMUX) return null
    try {
      const result = await $`tmux display-message -p '#S:#I'`.text()
      const loc = result.trim()
      return loc || null
    } catch {
      return null
    }
  }

  const notify = async (message: string) => {
    const loc = await tmuxLocation()
    const text = loc ? `${message} (${loc})` : message
    await $`osascript -e ${`display notification "${text.replace(/"/g, '\\"')}" with title "opencode" sound name "Glass"`}`
  }

  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await notify("Finished working on your prompt")
      }
      if (event.type === "permission.asked") {
        await notify("Needs your attention (permission)")
      }
      if (event.type === "session.error") {
        await notify("Session error - needs attention")
      }
    },
  }
}
