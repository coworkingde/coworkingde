require 'spec_helper'

describe City do
  it { should have_many(:spaces) }

end
