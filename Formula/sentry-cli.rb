class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.19.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.19.0/sentry-cli-Darwin-universal"
    sha256 "73f0d9f8cdf068f7202d74b3852a618901bad83c47d25e3ff00e293477b62963"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.0/sentry-cli-Linux-aarch64"
        sha256 "b958399bafe6e5f74a4064a1d11d9225bfcc228643422fb5a2e1183bf36baeb7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.0/sentry-cli-Linux-armv7"
        sha256 "05e763cb730ac1fd0b794cd1daefbaa409446d2f2b74a52cbe363b881fb18459"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.0/sentry-cli-Linux-x86_64"
        sha256 "83a9e51d8c164edc1e1180a5c7c10a3d653e02beb2db417927be73b4e43afa56"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.0/sentry-cli-Linux-i686"
        sha256 "67eb8b2cbef84cc307371eaeb95e144f6ea106eda3e1e9016092b873935d8932"
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
