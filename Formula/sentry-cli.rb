class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.4/sentry-cli-Darwin-universal"
    sha256 "4cead233d935a2c388d899bd9feba111464428d4b25393ebe341678d724c4b30"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.4/sentry-cli-Linux-aarch64"
        sha256 "a638db3d6d7356c4ad5556d288d8a13d57530a05bc73bc5f1b3e0edc46284967"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.4/sentry-cli-Linux-armv7"
        sha256 "2379dbd97f4049ca1c8f03a544c7fd1b93427e9cfc5b17a9ed099f71a57d9535"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.4/sentry-cli-Linux-x86_64"
        sha256 "22ba24c7019fc7f2ffc72307fa6a0ff5981f4254184f1e99777abc81aa4f8dde"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.4/sentry-cli-Linux-i686"
        sha256 "2c8cc53405c8019c22222524f2c44ec13cf3bc194ed38db288a91c3084a6c130"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
