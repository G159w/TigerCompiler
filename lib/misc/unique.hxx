/**
 ** \file misc/unique.hxx
 ** \brief Inline implementation of misc::unique.
 */

#pragma once

#include <misc/unique.hh>
#include <misc/contract.hh>

namespace misc
{
  template <typename T, class C>
  unique<T, C>::unique(const data_type& s)
    : obj_(&(*(object_set_instance().emplace(s).first)))
  // FIXME: Some code was deleted here (Initializations).
  {
  }

  template <typename T, class C>
  unique<T, C>::~unique()
  {}

  template <typename T, class C>
  typename unique<T, C>::object_set_type&
  unique<T, C>::object_set_instance()
  {
  // FIXME: Some code was deleted here (Classical Singleton pattern, a la Scott Meyers').
    static std::set<T, C> s;
    return s;
    //die("FIXME!");
  }

  template <typename T, class C>
  typename unique<T, C>::object_size_type
  unique<T, C>::object_map_size()
  {
    std::set<T, C> s = object_set_instance();
    return s.size();
  // FIXME: Some code was deleted here.
  }

  template <typename T, class C>
  inline const typename unique<T, C>::data_type&
  unique<T, C>::get() const
  {
    return *obj_;
  // FIXME: Some code was deleted here.
  }

  template <typename T, class C>
  inline
  unique<T, C>::operator const data_type&() const
  {
    return *obj_;
  // FIXME: Some code was deleted here.
  }

  template <typename  T, class C>
  inline typename unique<T, C>::value_type&
  unique<T, C>::operator=(const value_type& rhs)
  {
    if (this != &rhs)
      obj_ = rhs.obj_;
    return *this;
  }

  template <typename T, class C>
  inline bool
  unique<T, C>::operator==(const value_type& rhs) const
  {
    return obj_ == rhs.obj_;
  }

  template <typename T, class C>
  inline bool
  unique<T, C>::operator!=(const value_type& rhs) const
  {
    return !operator==(rhs);
  }

  template <typename T, class C>
  inline bool
  unique<T, C>::operator<(const value_type& rhs) const
  {
    C cmp;
    assertion(obj_);
    assertion(rhs.obj_);
    return cmp(*obj_, *rhs.obj_);
  }

  template <typename T, class C>
  inline std::ostream&
  operator<<(std::ostream& ostr, const unique<T, C>& the)
  {
    return ostr << the.get();
  }

} // namespace misc
