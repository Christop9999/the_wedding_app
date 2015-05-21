require 'spec_helper'

describe Wedding do
  it { should have_many(:venues)}
  it { should belong_to(:user)}
end
