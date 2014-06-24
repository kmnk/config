FluentIterable.from(Ranges.closed(1, size)
                          .asSet(DiscreteDomains.integers())
                          .asList())
              .transform(new Function<Integer, Hoge>() {
                  @Override
                  public Hoge apply(Integer int) {
                      return new Hoge();
                  }
              })
              .filter(new Predicate<Hoge>() {
                  @Override
                  public boolean apply(Hoge hoge) {
                      return hoge.isHoge();
                  }
              })
              .toList();
