func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] _ = {
    var result = ItemType[]()
    for i in 0..times {
         result += item
    }
    return result
}
repeat("knock", 4)
