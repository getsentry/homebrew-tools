class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.0-beta.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0-beta.0/sentry-cli-Darwin-universal"
    sha256 "e03a8bb2e20727b15e4119a3d400a9f2a6f1f398c9778180d6309a5c90e03be0"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0-beta.0/sentry-cli-Linux-aarch64"
        sha256 "59956827c710d5b052bfcf7173bfadb3e9df8f9e373247d444df4006416f4325"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0-beta.0/sentry-cli-Linux-armv7"
        sha256 "739a1def69101d0c253cf5b8dc4893ac9adf39d535060348ae12827da4494a2d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0-beta.0/sentry-cli-Linux-x86_64"
        sha256 "7e18bbb983bfdd866de99fa0d69eee79982e03d63fc0a8994f229ea176776178"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.0-beta.0/sentry-cli-Linux-i686"
        sha256 "a9348ed89c3aaccc519ae52030743efd8d46fc3c0209d8a345fb39b3a6bc76bb"
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
