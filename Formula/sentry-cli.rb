class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.32.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.32.1/sentry-cli-Darwin-universal"
    sha256 "46464fdb9bc433081b3341c1c3fdd3fc6b546ac30a79c4ba0646cfd61c30d8d2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.1/sentry-cli-Linux-aarch64"
        sha256 "4ac86ade7ff15391dfb7c2f3f24a2d05a2e43097f45f5c882043905aadd6060a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.1/sentry-cli-Linux-armv7"
        sha256 "58f8a7511db438b24aeef4e7e019e3d5b17d27dc264e4a15403b0833b2b51a3d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.1/sentry-cli-Linux-x86_64"
        sha256 "59238a42faea26e01cea3f0c9482a3bb2d1e5f200e3f9929820a11ab0eac5253"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.32.1/sentry-cli-Linux-i686"
        sha256 "d8d9789468d9b36361b290a3ab2aee451a6020ca84bdd7f80f25336661d8ccf7"
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
