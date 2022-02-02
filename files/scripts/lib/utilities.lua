-- プレイヤーのEntity_idを取ってくる
function getPlayerEntity()
  local players = EntityGetWithTag("player_unit")
  if #players == 0 then
    return
  end

  return players[1]
end

-- 呼ぶとプレイヤーが死ぬ
-- messageは死亡時の詳細テキスト(他のComponent経由でもメッセージを追加できる場合があるが、そのときはこのメッセージの前に設置されるよう)
function killPlayer(message)
  EntityInflictDamage(getPlayerEntity(), 999, "DAMAGE_SLICE", message, "BLOOD_EXPLOSION", 0, 0)
end

-- 特定のEnitity内にあるVariableStorageComponentへ値をセットする
function setInternalVariableValue(entity_id, variable_name, variable_type, new_value)

  local components = EntityGetComponent(entity_id, "VariableStorageComponent")
  if (components ~= nil) then
    for key, comp_id in pairs(components) do
      local var_name = ComponentGetValue2(comp_id, "name")
      if (var_name == variable_name) then
        ComponentSetValue2(comp_id, variable_type, new_value)
      end
    end
  end
end

-- 特定のEnitity内にあるVariableStorageComponentへ値を取得する
function getInternalVariableValue(entity_id, variable_name, variable_type)
  local value = nil
  local components = EntityGetComponent(entity_id, "VariableStorageComponent")
  if (components ~= nil) then
    for key, comp_id in pairs(components) do
      local var_name = ComponentGetValue2(comp_id, "name")
      if (var_name == variable_name) then
        value = ComponentGetValue2(comp_id, variable_type)
      end
    end
  end
  return value
end

-- 特定のEnitity内にVariableStorageComponentを拡張する
-- 初期化時に値をセットできるため、値を複数回更新しない場合はこの関数のみの利用で問題なし
function addNewInternalVariable(entity_id, variable_name, variable_type, initial_value)
  if (variable_type == "value_int") then
    EntityAddComponent2(entity_id, "VariableStorageComponent", {
      name = variable_name,
      value_int = initial_value,
    })
  elseif (variable_type == "value_string") then
    EntityAddComponent2(entity_id, "VariableStorageComponent", {
      name = variable_name,
      value_string = initial_value,
    })
  elseif (variable_type == "value_float") then
    EntityAddComponent2(entity_id, "VariableStorageComponent", {
      name = variable_name,
      value_float = initial_value,
    })
  elseif (variable_type == "value_bool") then
    EntityAddComponent2(entity_id, "VariableStorageComponent", {
      name = variable_name,
      value_bool = initial_value,
    })
  end
end

function secondToFrame(second)
  return second * 60
end

function frameToSecond(frame)
  return math.floor(frame / 60)
end

function p(message)
  print(message)
end
