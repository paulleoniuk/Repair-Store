# frozen_string_literal: true
module RepairStore
  MAJOR = 0
  MINOR = 0
  TINY  = 1
  PRE   = nil

  VERSION = [MAJOR, MINOR, TINY, PRE].compact.join('.').freeze
end
