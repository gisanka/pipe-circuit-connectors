require("circuit-connector-sprites")

---@alias CircuitConnectablePipePrototype data.PipePrototype|data.PipeToGroundPrototype

---Adds missing circuit network properties to every prototype of the given type.
---Existing connector definitions and wire distances are preserved.
---@param prototype_type "pipe"|"pipe-to-ground"
---@param connector_definition data.CircuitConnectorDefinition[]
local function add_missing_circuit_connector(prototype_type, connector_definition)
  ---@type table<string, CircuitConnectablePipePrototype>
  local prototypes = data.raw[prototype_type] or {}

  for _, prototype in pairs(prototypes) do
    if prototype.circuit_connector == nil then
      prototype.circuit_connector = connector_definition
    end

    if prototype.circuit_wire_max_distance == nil then
      prototype.circuit_wire_max_distance = default_circuit_wire_max_distance
    end
  end
end

local pipe_circuit_connector_definitions = circuit_connector_definitions["pipe"]
---@cast pipe_circuit_connector_definitions data.CircuitConnectorDefinition[]

local pipetoground_circuit_connector_definitions = circuit_connector_definitions["pipe-to-ground"]
---@cast pipetoground_circuit_connector_definitions data.CircuitConnectorDefinition[]

add_missing_circuit_connector("pipe", pipe_circuit_connector_definitions)
add_missing_circuit_connector("pipe-to-ground", pipetoground_circuit_connector_definitions)
