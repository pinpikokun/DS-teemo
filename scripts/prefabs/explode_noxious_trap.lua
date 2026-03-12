local assets =
{
    Asset("ANIM", "anim/explode_noxious_trap_g.zip"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("FX")
    inst.persists = false

    -- DS版: ネットワーク不要、直接アニメーション再生
    inst.AnimState:SetBank("poopcloud")
    inst.AnimState:SetBuild("explode_noxious_trap_g")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetFinalOffset(-1)

    inst:ListenForEvent("animover", inst.Remove)

    inst.Transform:SetFourFaced()

    inst:DoTaskInTime(1, inst.Remove)

    return inst
end

return Prefab("common/explode_noxious_trap", fn, assets)
