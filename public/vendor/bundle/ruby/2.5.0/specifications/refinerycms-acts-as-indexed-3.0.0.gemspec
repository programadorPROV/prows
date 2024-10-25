# -*- encoding: utf-8 -*-
# stub: refinerycms-acts-as-indexed 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-acts-as-indexed".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "U\u0123is Ozols".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDhjCCAm6gAwIBAgIBATANBgkqhkiG9w0BAQUFADBNMQ0wCwYDVQQDDARnZW1z\nMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixkARkWBWFybmR0MRIwEAYK\nCZImiZPyLGQBGRYCaW8wHhcNMTYwNjEwMDMwNjQyWhcNMTcwNjEwMDMwNjQyWjBN\nMQ0wCwYDVQQDDARnZW1zMREwDwYKCZImiZPyLGQBGRYBcDEVMBMGCgmSJomT8ixk\nARkWBWFybmR0MRIwEAYKCZImiZPyLGQBGRYCaW8wggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQDMLLiiRX/NrRDQxcNO/bPNe51IhKeyACDjTTx0VGCG696t\nqdD23FjUrAYuQTW5P7Auh9qdcCnvPHJSwf31m+EGTshy/hcNYz2k/mrbwAfdytv3\nGAR+sFnMYtWvVQNeHBWXIaYMiSDP0WtbT6QqQx3SuA6ZpXNXD1dbm64MzHgMHqXP\nuHnLf2s0VCnTLorPH2J6CO5Y+Sx+IBqJi9/nO2oEEIXQCQRLgRevHk+TovDisW5V\nOMEPX7fo29R5J2T7mjkNLGJ5Ae1KiU9A60LsMco37HMWE8DM90pg1ues5tg6MfJT\nyuX4N0rJWdIC5ciHDsyJ4pi21s8fdUulk0YmJALDAgMBAAGjcTBvMAkGA1UdEwQC\nMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBSqXg48+kmcdOxIrkZhhgSV1flD1jAa\nBgNVHREEEzARgQ9nZW1zQHAuYXJuZHQuaW8wGgYDVR0SBBMwEYEPZ2Vtc0BwLmFy\nbmR0LmlvMA0GCSqGSIb3DQEBBQUAA4IBAQBSSS4nOXpPPMdAK4ApGHxbzS+/u77p\nV8gLBJX4hKMpbMNmdI+n6YsqvG6kMljgYBamucfrAkKdmHWn9ydST3o8RQAcYxS8\nbz49gD3c4Nm4P6eEVKFmebO9/MoiM7rMb0lk/xH1drtey/9ulohrg8Dz+BoQJ+9T\nm2lJzojOU7w461lPVZtKlDlseu68KvEQ2AdUBBa1b6w3S/EFkcdhErOT7dyQpePI\n+wsbjPvdIWsjWQMn6MasZYIVTnenwP2jg+z9HSNxW0NL2vZx8VabpsWGWfrb+koj\nrE1h12GTgwaC3r9FOkdnSpClgPYAzTTCJ8kD74qO2zC9pGegrUXdWFM6\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2016-06-10"
  s.description = "An extension to handle the integration of Refinery CMS and ActsAsIndexed".freeze
  s.email = "gems@p.arndt.io".freeze
  s.homepage = "http://refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Refinery CMS ActsAsIndexed integration plugin".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
      s.add_runtime_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
      s.add_runtime_dependency(%q<decorators>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<stringex>.freeze, ["~> 2.5.2"])
    else
      s.add_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
      s.add_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
      s.add_dependency(%q<decorators>.freeze, ["~> 2.0"])
      s.add_dependency(%q<stringex>.freeze, ["~> 2.5.2"])
    end
  else
    s.add_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
    s.add_dependency(%q<acts_as_indexed>.freeze, ["~> 0.8.0"])
    s.add_dependency(%q<decorators>.freeze, ["~> 2.0"])
    s.add_dependency(%q<stringex>.freeze, ["~> 2.5.2"])
  end
end
