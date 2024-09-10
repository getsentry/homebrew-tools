class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.1/sentry-cli-Darwin-universal"
    sha256 "f1362e84b79599b549ccd31f0f6b3a38374ab2160b75a92ba465676ab9137538"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.1/sentry-cli-Linux-aarch64"
        sha256 "605a94cdc60edce7891457116d2f04ffec3d4f7c21fc51dbcd84eb877f34d50e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.1/sentry-cli-Linux-armv7"
        sha256 "82723ab0964ae691c2fa93061a31f299ccebf06f8b70454779f027e55ac3e91e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.1/sentry-cli-Linux-x86_64"
        sha256 "4c3ff70421eecf5c4dbc6d15256a9c7eb28d6804d3e1b6717edf3a1a8b7a05c3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.1/sentry-cli-Linux-i686"
        sha256 "adad98902ed0e5001c60a2783684417ef147c3229da97812ee18ac75af65e733"
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
