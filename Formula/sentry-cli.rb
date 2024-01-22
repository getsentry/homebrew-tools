class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.26.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.26.0/sentry-cli-Darwin-universal"
    sha256 "6540c1479047a9ef3dcc0f8c821a4e70c4ae05a2af25ec25c6565bc82a04c3fa"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.26.0/sentry-cli-Linux-aarch64"
        sha256 "a775fa8501e4fe032900f5b645919fe77554a1217622f997fc52f7a36f0ae416"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.26.0/sentry-cli-Linux-armv7"
        sha256 "a73eee13fedd8a5adf1f70783a393a957c43a98debad0340b0657fc1f12514a1"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.26.0/sentry-cli-Linux-x86_64"
        sha256 "71dd4266b7b3e1b58bdf70742716107d9eaf0b194d898819ebe0316b6f7f61e5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.26.0/sentry-cli-Linux-i686"
        sha256 "975f73ba1315096f49e585c0e28b8b4704231c6ceeec595fa049421d1fc298ec"
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
