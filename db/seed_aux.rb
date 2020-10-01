def feed_order(usr)
  rand(1..4).times do |i|
    h_seed = {user_id: usr.id}
    if Order.all.where(user_id: usr.id).count.positive?
      case rand(1..100)
        when 1..80 then h_seed[:status] = 2
        when 81..100 then h_seed[:status] = 3
      end
    else
      case rand(1..100)
        when 1..80 then h_seed[:status] = 1
        when 81..95 then h_seed[:status] = 2
        when 96..100 then h_seed[:status] = 3
      end
    end
    h_seed[:category] = rand(1..2)
    h_seed[:justify] = "justificativa #{i}"
    Order.create!(h_seed)
  end
end

def feed_item
  Order.all.each do |order|
    Variable.all.sample([5, rand(Variable.count)].min).each do |variable|
      h_seed = { order_id: order.id }
      h_seed[:variable_id] = variable.id
      Item.create!(h_seed)
    end
  end
end
