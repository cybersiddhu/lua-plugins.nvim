local Options = {}
function Options.init_default_values()
  table.insert(Options,
    { engine = { arg = "-e", value = "duckduckgo" },
      limit = { arg = "-l", value = 10 } }
  )
end

function Options.set_engine(engine)
  Options.engine.value = engine
end

function Options.set_limit(limit)
  Options.limit.value = limit
end

function Options.engine()
  return Options.engine.value
end

function Options.limit()
  return Options.limit.value
end

return Options
