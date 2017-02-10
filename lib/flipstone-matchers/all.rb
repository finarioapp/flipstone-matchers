RSpec::Matchers.define :all do |matcher|
  match do |array|
    array.all? do |item|
      matcher.matches? item
    end
  end

  failure_message do |array|
    array.each_with_index.map do |item, idx|
      unless matcher.matches? item
        "item #{idx} (#{item}): #{matcher.failure_message}"
      end
    end.compact.join("\n")
  end
end

